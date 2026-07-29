# Explore: explore_0833
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02500.view.lkml"
include: "/views/domain_02/view_02502.view.lkml"
include: "/views/domain_03/view_02503.view.lkml"
include: "/views/domain_04/view_02504.view.lkml"

explore: explore_0833 {
  label: "Explore Explore 0833"
  description: "Comprehensive analytics explore joining base view_02500 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02500
  
  always_filter: {
    filters: [view_02500.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02500.created_at_date: "7 days"]
    unless: [view_02500.id, view_02500.status]
  }

  join: view_02502 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02500.user_id} = ${view_02502.id} ;;
    required_joins: []
  }

  join: view_02503 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02500.account_id} = ${view_02503.account_id} ;;
    required_joins: [view_02502]
  }

  join: view_02504 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02500.category} = ${view_02504.category} ;;
  }

  access_filter: {
    field: view_02500.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02500.is_deleted} = false ;;
}

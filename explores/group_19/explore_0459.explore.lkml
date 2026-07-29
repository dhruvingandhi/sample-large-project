# Explore: explore_0459
# Auto-generated LookML Explore File

include: "/views/domain_28/view_01378.view.lkml"
include: "/views/domain_30/view_01380.view.lkml"
include: "/views/domain_31/view_01381.view.lkml"
include: "/views/domain_32/view_01382.view.lkml"

explore: explore_0459 {
  label: "Explore Explore 0459"
  description: "Comprehensive analytics explore joining base view_01378 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01378
  
  always_filter: {
    filters: [view_01378.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01378.created_at_date: "7 days"]
    unless: [view_01378.id, view_01378.status]
  }

  join: view_01380 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01378.user_id} = ${view_01380.id} ;;
    required_joins: []
  }

  join: view_01381 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01378.account_id} = ${view_01381.account_id} ;;
    required_joins: [view_01380]
  }

  join: view_01382 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01378.category} = ${view_01382.category} ;;
  }

  access_filter: {
    field: view_01378.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01378.is_deleted} = false ;;
}

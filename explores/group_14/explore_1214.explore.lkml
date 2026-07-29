# Explore: explore_1214
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03643.view.lkml"
include: "/views/domain_45/view_03645.view.lkml"
include: "/views/domain_46/view_03646.view.lkml"
include: "/views/domain_47/view_03647.view.lkml"

explore: explore_1214 {
  label: "Explore Explore 1214"
  description: "Comprehensive analytics explore joining base view_03643 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03643
  
  always_filter: {
    filters: [view_03643.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03643.created_at_date: "7 days"]
    unless: [view_03643.id, view_03643.status]
  }

  join: view_03645 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03643.user_id} = ${view_03645.id} ;;
    required_joins: []
  }

  join: view_03646 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03643.account_id} = ${view_03646.account_id} ;;
    required_joins: [view_03645]
  }

  join: view_03647 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03643.category} = ${view_03647.category} ;;
  }

  access_filter: {
    field: view_03643.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03643.is_deleted} = false ;;
}

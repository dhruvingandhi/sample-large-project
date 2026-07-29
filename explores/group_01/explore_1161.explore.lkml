# Explore: explore_1161
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03484.view.lkml"
include: "/views/domain_36/view_03486.view.lkml"
include: "/views/domain_37/view_03487.view.lkml"
include: "/views/domain_38/view_03488.view.lkml"

explore: explore_1161 {
  label: "Explore Explore 1161"
  description: "Comprehensive analytics explore joining base view_03484 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03484
  
  always_filter: {
    filters: [view_03484.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03484.created_at_date: "7 days"]
    unless: [view_03484.id, view_03484.status]
  }

  join: view_03486 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03484.user_id} = ${view_03486.id} ;;
    required_joins: []
  }

  join: view_03487 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03484.account_id} = ${view_03487.account_id} ;;
    required_joins: [view_03486]
  }

  join: view_03488 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03484.category} = ${view_03488.category} ;;
  }

  access_filter: {
    field: view_03484.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03484.is_deleted} = false ;;
}

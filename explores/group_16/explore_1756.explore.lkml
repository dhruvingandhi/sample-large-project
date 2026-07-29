# Explore: explore_1756
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05269.view.lkml"
include: "/views/domain_21/view_05271.view.lkml"
include: "/views/domain_22/view_05272.view.lkml"
include: "/views/domain_23/view_05273.view.lkml"

explore: explore_1756 {
  label: "Explore Explore 1756"
  description: "Comprehensive analytics explore joining base view_05269 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05269
  
  always_filter: {
    filters: [view_05269.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05269.created_at_date: "7 days"]
    unless: [view_05269.id, view_05269.status]
  }

  join: view_05271 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05269.user_id} = ${view_05271.id} ;;
    required_joins: []
  }

  join: view_05272 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05269.account_id} = ${view_05272.account_id} ;;
    required_joins: [view_05271]
  }

  join: view_05273 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05269.category} = ${view_05273.category} ;;
  }

  access_filter: {
    field: view_05269.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05269.is_deleted} = false ;;
}

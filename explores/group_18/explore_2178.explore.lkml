# Update for 2000 file diff target
# Explore: explore_2178
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06535.view.lkml"
include: "/views/domain_37/view_06537.view.lkml"
include: "/views/domain_38/view_06538.view.lkml"
include: "/views/domain_39/view_06539.view.lkml"

explore: explore_2178 {
  label: "Explore Explore 2178"
  description: "Comprehensive analytics explore joining base view_06535 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06535
  
  always_filter: {
    filters: [view_06535.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06535.created_at_date: "7 days"]
    unless: [view_06535.id, view_06535.status]
  }

  join: view_06537 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06535.user_id} = ${view_06537.id} ;;
    required_joins: []
  }

  join: view_06538 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06535.account_id} = ${view_06538.account_id} ;;
    required_joins: [view_06537]
  }

  join: view_06539 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06535.category} = ${view_06539.category} ;;
  }

  access_filter: {
    field: view_06535.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06535.is_deleted} = false ;;
}

# Explore: explore_0378
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01135.view.lkml"
include: "/views/domain_37/view_01137.view.lkml"
include: "/views/domain_38/view_01138.view.lkml"
include: "/views/domain_39/view_01139.view.lkml"

explore: explore_0378 {
  label: "Explore Explore 0378"
  description: "Comprehensive analytics explore joining base view_01135 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01135
  
  always_filter: {
    filters: [view_01135.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01135.created_at_date: "7 days"]
    unless: [view_01135.id, view_01135.status]
  }

  join: view_01137 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01135.user_id} = ${view_01137.id} ;;
    required_joins: []
  }

  join: view_01138 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01135.account_id} = ${view_01138.account_id} ;;
    required_joins: [view_01137]
  }

  join: view_01139 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01135.category} = ${view_01139.category} ;;
  }

  access_filter: {
    field: view_01135.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01135.is_deleted} = false ;;
}

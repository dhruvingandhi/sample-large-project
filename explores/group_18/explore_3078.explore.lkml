# Explore: explore_3078
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09235.view.lkml"
include: "/views/domain_37/view_09237.view.lkml"
include: "/views/domain_38/view_09238.view.lkml"
include: "/views/domain_39/view_09239.view.lkml"

explore: explore_3078 {
  label: "Explore Explore 3078"
  description: "Comprehensive analytics explore joining base view_09235 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09235
  
  always_filter: {
    filters: [view_09235.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09235.created_at_date: "7 days"]
    unless: [view_09235.id, view_09235.status]
  }

  join: view_09237 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09235.user_id} = ${view_09237.id} ;;
    required_joins: []
  }

  join: view_09238 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09235.account_id} = ${view_09238.account_id} ;;
    required_joins: [view_09237]
  }

  join: view_09239 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09235.category} = ${view_09239.category} ;;
  }

  access_filter: {
    field: view_09235.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09235.is_deleted} = false ;;
}

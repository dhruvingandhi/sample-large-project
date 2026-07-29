# Explore: explore_0078
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00235.view.lkml"
include: "/views/domain_37/view_00237.view.lkml"
include: "/views/domain_38/view_00238.view.lkml"
include: "/views/domain_39/view_00239.view.lkml"

explore: explore_0078 {
  label: "Explore Explore 0078"
  description: "Comprehensive analytics explore joining base view_00235 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00235
  
  always_filter: {
    filters: [view_00235.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00235.created_at_date: "7 days"]
    unless: [view_00235.id, view_00235.status]
  }

  join: view_00237 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00235.user_id} = ${view_00237.id} ;;
    required_joins: []
  }

  join: view_00238 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00235.account_id} = ${view_00238.account_id} ;;
    required_joins: [view_00237]
  }

  join: view_00239 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00235.category} = ${view_00239.category} ;;
  }

  access_filter: {
    field: view_00235.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00235.is_deleted} = false ;;
}

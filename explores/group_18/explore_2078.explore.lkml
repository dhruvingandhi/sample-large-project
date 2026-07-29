# Explore: explore_2078
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06235.view.lkml"
include: "/views/domain_37/view_06237.view.lkml"
include: "/views/domain_38/view_06238.view.lkml"
include: "/views/domain_39/view_06239.view.lkml"

explore: explore_2078 {
  label: "Explore Explore 2078"
  description: "Comprehensive analytics explore joining base view_06235 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06235
  
  always_filter: {
    filters: [view_06235.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06235.created_at_date: "7 days"]
    unless: [view_06235.id, view_06235.status]
  }

  join: view_06237 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06235.user_id} = ${view_06237.id} ;;
    required_joins: []
  }

  join: view_06238 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06235.account_id} = ${view_06238.account_id} ;;
    required_joins: [view_06237]
  }

  join: view_06239 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06235.category} = ${view_06239.category} ;;
  }

  access_filter: {
    field: view_06235.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06235.is_deleted} = false ;;
}

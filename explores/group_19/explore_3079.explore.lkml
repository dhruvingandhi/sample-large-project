# Update for 2000 file diff target
# Explore: explore_3079
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09238.view.lkml"
include: "/views/domain_40/view_09240.view.lkml"
include: "/views/domain_41/view_09241.view.lkml"
include: "/views/domain_42/view_09242.view.lkml"

explore: explore_3079 {
  label: "Explore Explore 3079"
  description: "Comprehensive analytics explore joining base view_09238 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09238
  
  always_filter: {
    filters: [view_09238.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09238.created_at_date: "7 days"]
    unless: [view_09238.id, view_09238.status]
  }

  join: view_09240 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09238.user_id} = ${view_09240.id} ;;
    required_joins: []
  }

  join: view_09241 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09238.account_id} = ${view_09241.account_id} ;;
    required_joins: [view_09240]
  }

  join: view_09242 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09238.category} = ${view_09242.category} ;;
  }

  access_filter: {
    field: view_09238.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09238.is_deleted} = false ;;
}

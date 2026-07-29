# Explore: explore_3156
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09469.view.lkml"
include: "/views/domain_21/view_09471.view.lkml"
include: "/views/domain_22/view_09472.view.lkml"
include: "/views/domain_23/view_09473.view.lkml"

explore: explore_3156 {
  label: "Explore Explore 3156"
  description: "Comprehensive analytics explore joining base view_09469 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09469
  
  always_filter: {
    filters: [view_09469.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09469.created_at_date: "7 days"]
    unless: [view_09469.id, view_09469.status]
  }

  join: view_09471 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09469.user_id} = ${view_09471.id} ;;
    required_joins: []
  }

  join: view_09472 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09469.account_id} = ${view_09472.account_id} ;;
    required_joins: [view_09471]
  }

  join: view_09473 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09469.category} = ${view_09473.category} ;;
  }

  access_filter: {
    field: view_09469.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09469.is_deleted} = false ;;
}

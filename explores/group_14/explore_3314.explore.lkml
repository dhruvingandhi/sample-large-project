# Explore: explore_3314
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09943.view.lkml"
include: "/views/domain_45/view_09945.view.lkml"
include: "/views/domain_46/view_09946.view.lkml"
include: "/views/domain_47/view_09947.view.lkml"

explore: explore_3314 {
  label: "Explore Explore 3314"
  description: "Comprehensive analytics explore joining base view_09943 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09943
  
  always_filter: {
    filters: [view_09943.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09943.created_at_date: "7 days"]
    unless: [view_09943.id, view_09943.status]
  }

  join: view_09945 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09943.user_id} = ${view_09945.id} ;;
    required_joins: []
  }

  join: view_09946 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09943.account_id} = ${view_09946.account_id} ;;
    required_joins: [view_09945]
  }

  join: view_09947 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09943.category} = ${view_09947.category} ;;
  }

  access_filter: {
    field: view_09943.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09943.is_deleted} = false ;;
}

# Explore: explore_3727
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11182.view.lkml"
include: "/views/domain_34/view_11184.view.lkml"
include: "/views/domain_35/view_11185.view.lkml"
include: "/views/domain_36/view_11186.view.lkml"

explore: explore_3727 {
  label: "Explore Explore 3727"
  description: "Comprehensive analytics explore joining base view_11182 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11182
  
  always_filter: {
    filters: [view_11182.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11182.created_at_date: "7 days"]
    unless: [view_11182.id, view_11182.status]
  }

  join: view_11184 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11182.user_id} = ${view_11184.id} ;;
    required_joins: []
  }

  join: view_11185 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11182.account_id} = ${view_11185.account_id} ;;
    required_joins: [view_11184]
  }

  join: view_11186 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11182.category} = ${view_11186.category} ;;
  }

  access_filter: {
    field: view_11182.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11182.is_deleted} = false ;;
}

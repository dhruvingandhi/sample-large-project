# Explore: explore_3208
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09625.view.lkml"
include: "/views/domain_27/view_09627.view.lkml"
include: "/views/domain_28/view_09628.view.lkml"
include: "/views/domain_29/view_09629.view.lkml"

explore: explore_3208 {
  label: "Explore Explore 3208"
  description: "Comprehensive analytics explore joining base view_09625 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09625
  
  always_filter: {
    filters: [view_09625.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09625.created_at_date: "7 days"]
    unless: [view_09625.id, view_09625.status]
  }

  join: view_09627 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09625.user_id} = ${view_09627.id} ;;
    required_joins: []
  }

  join: view_09628 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09625.account_id} = ${view_09628.account_id} ;;
    required_joins: [view_09627]
  }

  join: view_09629 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09625.category} = ${view_09629.category} ;;
  }

  access_filter: {
    field: view_09625.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09625.is_deleted} = false ;;
}

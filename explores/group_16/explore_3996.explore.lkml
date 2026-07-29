# Explore: explore_3996
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11989.view.lkml"
include: "/views/domain_41/view_11991.view.lkml"
include: "/views/domain_42/view_11992.view.lkml"
include: "/views/domain_43/view_11993.view.lkml"

explore: explore_3996 {
  label: "Explore Explore 3996"
  description: "Comprehensive analytics explore joining base view_11989 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11989
  
  always_filter: {
    filters: [view_11989.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11989.created_at_date: "7 days"]
    unless: [view_11989.id, view_11989.status]
  }

  join: view_11991 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11989.user_id} = ${view_11991.id} ;;
    required_joins: []
  }

  join: view_11992 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11989.account_id} = ${view_11992.account_id} ;;
    required_joins: [view_11991]
  }

  join: view_11993 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11989.category} = ${view_11993.category} ;;
  }

  access_filter: {
    field: view_11989.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11989.is_deleted} = false ;;
}

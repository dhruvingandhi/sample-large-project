# Explore: explore_3921
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11764.view.lkml"
include: "/views/domain_16/view_11766.view.lkml"
include: "/views/domain_17/view_11767.view.lkml"
include: "/views/domain_18/view_11768.view.lkml"

explore: explore_3921 {
  label: "Explore Explore 3921"
  description: "Comprehensive analytics explore joining base view_11764 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11764
  
  always_filter: {
    filters: [view_11764.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11764.created_at_date: "7 days"]
    unless: [view_11764.id, view_11764.status]
  }

  join: view_11766 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11764.user_id} = ${view_11766.id} ;;
    required_joins: []
  }

  join: view_11767 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11764.account_id} = ${view_11767.account_id} ;;
    required_joins: [view_11766]
  }

  join: view_11768 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11764.category} = ${view_11768.category} ;;
  }

  access_filter: {
    field: view_11764.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11764.is_deleted} = false ;;
}

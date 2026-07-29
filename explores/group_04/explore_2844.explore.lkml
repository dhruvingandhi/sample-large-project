# Explore: explore_2844
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08533.view.lkml"
include: "/views/domain_35/view_08535.view.lkml"
include: "/views/domain_36/view_08536.view.lkml"
include: "/views/domain_37/view_08537.view.lkml"

explore: explore_2844 {
  label: "Explore Explore 2844"
  description: "Comprehensive analytics explore joining base view_08533 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08533
  
  always_filter: {
    filters: [view_08533.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08533.created_at_date: "7 days"]
    unless: [view_08533.id, view_08533.status]
  }

  join: view_08535 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08533.user_id} = ${view_08535.id} ;;
    required_joins: []
  }

  join: view_08536 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08533.account_id} = ${view_08536.account_id} ;;
    required_joins: [view_08535]
  }

  join: view_08537 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08533.category} = ${view_08537.category} ;;
  }

  access_filter: {
    field: view_08533.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08533.is_deleted} = false ;;
}

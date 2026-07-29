# Explore: explore_3908
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11725.view.lkml"
include: "/views/domain_27/view_11727.view.lkml"
include: "/views/domain_28/view_11728.view.lkml"
include: "/views/domain_29/view_11729.view.lkml"

explore: explore_3908 {
  label: "Explore Explore 3908"
  description: "Comprehensive analytics explore joining base view_11725 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11725
  
  always_filter: {
    filters: [view_11725.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11725.created_at_date: "7 days"]
    unless: [view_11725.id, view_11725.status]
  }

  join: view_11727 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11725.user_id} = ${view_11727.id} ;;
    required_joins: []
  }

  join: view_11728 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11725.account_id} = ${view_11728.account_id} ;;
    required_joins: [view_11727]
  }

  join: view_11729 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11725.category} = ${view_11729.category} ;;
  }

  access_filter: {
    field: view_11725.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11725.is_deleted} = false ;;
}

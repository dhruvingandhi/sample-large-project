# Explore: explore_1673
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05020.view.lkml"
include: "/views/domain_22/view_05022.view.lkml"
include: "/views/domain_23/view_05023.view.lkml"
include: "/views/domain_24/view_05024.view.lkml"

explore: explore_1673 {
  label: "Explore Explore 1673"
  description: "Comprehensive analytics explore joining base view_05020 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05020
  
  always_filter: {
    filters: [view_05020.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05020.created_at_date: "7 days"]
    unless: [view_05020.id, view_05020.status]
  }

  join: view_05022 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05020.user_id} = ${view_05022.id} ;;
    required_joins: []
  }

  join: view_05023 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05020.account_id} = ${view_05023.account_id} ;;
    required_joins: [view_05022]
  }

  join: view_05024 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05020.category} = ${view_05024.category} ;;
  }

  access_filter: {
    field: view_05020.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05020.is_deleted} = false ;;
}

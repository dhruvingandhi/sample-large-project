# Explore: explore_0339
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01018.view.lkml"
include: "/views/domain_20/view_01020.view.lkml"
include: "/views/domain_21/view_01021.view.lkml"
include: "/views/domain_22/view_01022.view.lkml"

explore: explore_0339 {
  label: "Explore Explore 0339"
  description: "Comprehensive analytics explore joining base view_01018 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01018
  
  always_filter: {
    filters: [view_01018.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01018.created_at_date: "7 days"]
    unless: [view_01018.id, view_01018.status]
  }

  join: view_01020 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01018.user_id} = ${view_01020.id} ;;
    required_joins: []
  }

  join: view_01021 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01018.account_id} = ${view_01021.account_id} ;;
    required_joins: [view_01020]
  }

  join: view_01022 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01018.category} = ${view_01022.category} ;;
  }

  access_filter: {
    field: view_01018.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01018.is_deleted} = false ;;
}

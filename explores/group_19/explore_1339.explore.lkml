# Update for 2000 file diff target
# Explore: explore_1339
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04018.view.lkml"
include: "/views/domain_20/view_04020.view.lkml"
include: "/views/domain_21/view_04021.view.lkml"
include: "/views/domain_22/view_04022.view.lkml"

explore: explore_1339 {
  label: "Explore Explore 1339"
  description: "Comprehensive analytics explore joining base view_04018 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04018
  
  always_filter: {
    filters: [view_04018.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04018.created_at_date: "7 days"]
    unless: [view_04018.id, view_04018.status]
  }

  join: view_04020 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04018.user_id} = ${view_04020.id} ;;
    required_joins: []
  }

  join: view_04021 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04018.account_id} = ${view_04021.account_id} ;;
    required_joins: [view_04020]
  }

  join: view_04022 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04018.category} = ${view_04022.category} ;;
  }

  access_filter: {
    field: view_04018.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04018.is_deleted} = false ;;
}

# Update for 2000 file diff target
# Explore: explore_2339
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07018.view.lkml"
include: "/views/domain_20/view_07020.view.lkml"
include: "/views/domain_21/view_07021.view.lkml"
include: "/views/domain_22/view_07022.view.lkml"

explore: explore_2339 {
  label: "Explore Explore 2339"
  description: "Comprehensive analytics explore joining base view_07018 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07018
  
  always_filter: {
    filters: [view_07018.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07018.created_at_date: "7 days"]
    unless: [view_07018.id, view_07018.status]
  }

  join: view_07020 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07018.user_id} = ${view_07020.id} ;;
    required_joins: []
  }

  join: view_07021 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07018.account_id} = ${view_07021.account_id} ;;
    required_joins: [view_07020]
  }

  join: view_07022 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07018.category} = ${view_07022.category} ;;
  }

  access_filter: {
    field: view_07018.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07018.is_deleted} = false ;;
}

# Explore: explore_3788
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11365.view.lkml"
include: "/views/domain_17/view_11367.view.lkml"
include: "/views/domain_18/view_11368.view.lkml"
include: "/views/domain_19/view_11369.view.lkml"

explore: explore_3788 {
  label: "Explore Explore 3788"
  description: "Comprehensive analytics explore joining base view_11365 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11365
  
  always_filter: {
    filters: [view_11365.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11365.created_at_date: "7 days"]
    unless: [view_11365.id, view_11365.status]
  }

  join: view_11367 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11365.user_id} = ${view_11367.id} ;;
    required_joins: []
  }

  join: view_11368 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11365.account_id} = ${view_11368.account_id} ;;
    required_joins: [view_11367]
  }

  join: view_11369 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11365.category} = ${view_11369.category} ;;
  }

  access_filter: {
    field: view_11365.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11365.is_deleted} = false ;;
}

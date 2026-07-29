# Explore: explore_1788
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05365.view.lkml"
include: "/views/domain_17/view_05367.view.lkml"
include: "/views/domain_18/view_05368.view.lkml"
include: "/views/domain_19/view_05369.view.lkml"

explore: explore_1788 {
  label: "Explore Explore 1788"
  description: "Comprehensive analytics explore joining base view_05365 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05365
  
  always_filter: {
    filters: [view_05365.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05365.created_at_date: "7 days"]
    unless: [view_05365.id, view_05365.status]
  }

  join: view_05367 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05365.user_id} = ${view_05367.id} ;;
    required_joins: []
  }

  join: view_05368 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05365.account_id} = ${view_05368.account_id} ;;
    required_joins: [view_05367]
  }

  join: view_05369 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05365.category} = ${view_05369.category} ;;
  }

  access_filter: {
    field: view_05365.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05365.is_deleted} = false ;;
}

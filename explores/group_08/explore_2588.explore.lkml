# Explore: explore_2588
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07765.view.lkml"
include: "/views/domain_17/view_07767.view.lkml"
include: "/views/domain_18/view_07768.view.lkml"
include: "/views/domain_19/view_07769.view.lkml"

explore: explore_2588 {
  label: "Explore Explore 2588"
  description: "Comprehensive analytics explore joining base view_07765 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07765
  
  always_filter: {
    filters: [view_07765.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07765.created_at_date: "7 days"]
    unless: [view_07765.id, view_07765.status]
  }

  join: view_07767 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07765.user_id} = ${view_07767.id} ;;
    required_joins: []
  }

  join: view_07768 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07765.account_id} = ${view_07768.account_id} ;;
    required_joins: [view_07767]
  }

  join: view_07769 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07765.category} = ${view_07769.category} ;;
  }

  access_filter: {
    field: view_07765.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07765.is_deleted} = false ;;
}

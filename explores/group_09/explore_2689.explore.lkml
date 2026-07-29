# Explore: explore_2689
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08068.view.lkml"
include: "/views/domain_20/view_08070.view.lkml"
include: "/views/domain_21/view_08071.view.lkml"
include: "/views/domain_22/view_08072.view.lkml"

explore: explore_2689 {
  label: "Explore Explore 2689"
  description: "Comprehensive analytics explore joining base view_08068 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08068
  
  always_filter: {
    filters: [view_08068.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08068.created_at_date: "7 days"]
    unless: [view_08068.id, view_08068.status]
  }

  join: view_08070 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08068.user_id} = ${view_08070.id} ;;
    required_joins: []
  }

  join: view_08071 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08068.account_id} = ${view_08071.account_id} ;;
    required_joins: [view_08070]
  }

  join: view_08072 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08068.category} = ${view_08072.category} ;;
  }

  access_filter: {
    field: view_08068.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08068.is_deleted} = false ;;
}

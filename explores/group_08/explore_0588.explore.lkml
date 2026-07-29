# Explore: explore_0588
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01765.view.lkml"
include: "/views/domain_17/view_01767.view.lkml"
include: "/views/domain_18/view_01768.view.lkml"
include: "/views/domain_19/view_01769.view.lkml"

explore: explore_0588 {
  label: "Explore Explore 0588"
  description: "Comprehensive analytics explore joining base view_01765 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01765
  
  always_filter: {
    filters: [view_01765.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01765.created_at_date: "7 days"]
    unless: [view_01765.id, view_01765.status]
  }

  join: view_01767 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01765.user_id} = ${view_01767.id} ;;
    required_joins: []
  }

  join: view_01768 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01765.account_id} = ${view_01768.account_id} ;;
    required_joins: [view_01767]
  }

  join: view_01769 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01765.category} = ${view_01769.category} ;;
  }

  access_filter: {
    field: view_01765.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01765.is_deleted} = false ;;
}

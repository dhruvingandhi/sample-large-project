# Explore: explore_2571
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07714.view.lkml"
include: "/views/domain_16/view_07716.view.lkml"
include: "/views/domain_17/view_07717.view.lkml"
include: "/views/domain_18/view_07718.view.lkml"

explore: explore_2571 {
  label: "Explore Explore 2571"
  description: "Comprehensive analytics explore joining base view_07714 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07714
  
  always_filter: {
    filters: [view_07714.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07714.created_at_date: "7 days"]
    unless: [view_07714.id, view_07714.status]
  }

  join: view_07716 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07714.user_id} = ${view_07716.id} ;;
    required_joins: []
  }

  join: view_07717 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07714.account_id} = ${view_07717.account_id} ;;
    required_joins: [view_07716]
  }

  join: view_07718 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07714.category} = ${view_07718.category} ;;
  }

  access_filter: {
    field: view_07714.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07714.is_deleted} = false ;;
}

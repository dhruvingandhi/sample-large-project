# Explore: explore_2267
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06802.view.lkml"
include: "/views/domain_04/view_06804.view.lkml"
include: "/views/domain_05/view_06805.view.lkml"
include: "/views/domain_06/view_06806.view.lkml"

explore: explore_2267 {
  label: "Explore Explore 2267"
  description: "Comprehensive analytics explore joining base view_06802 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06802
  
  always_filter: {
    filters: [view_06802.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06802.created_at_date: "7 days"]
    unless: [view_06802.id, view_06802.status]
  }

  join: view_06804 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06802.user_id} = ${view_06804.id} ;;
    required_joins: []
  }

  join: view_06805 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06802.account_id} = ${view_06805.account_id} ;;
    required_joins: [view_06804]
  }

  join: view_06806 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06802.category} = ${view_06806.category} ;;
  }

  access_filter: {
    field: view_06802.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06802.is_deleted} = false ;;
}

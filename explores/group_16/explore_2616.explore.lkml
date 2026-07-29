# Explore: explore_2616
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07849.view.lkml"
include: "/views/domain_01/view_07851.view.lkml"
include: "/views/domain_02/view_07852.view.lkml"
include: "/views/domain_03/view_07853.view.lkml"

explore: explore_2616 {
  label: "Explore Explore 2616"
  description: "Comprehensive analytics explore joining base view_07849 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07849
  
  always_filter: {
    filters: [view_07849.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07849.created_at_date: "7 days"]
    unless: [view_07849.id, view_07849.status]
  }

  join: view_07851 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07849.user_id} = ${view_07851.id} ;;
    required_joins: []
  }

  join: view_07852 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07849.account_id} = ${view_07852.account_id} ;;
    required_joins: [view_07851]
  }

  join: view_07853 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07849.category} = ${view_07853.category} ;;
  }

  access_filter: {
    field: view_07849.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07849.is_deleted} = false ;;
}

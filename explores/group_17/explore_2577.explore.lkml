# Update for 2000 file diff target
# Explore: explore_2577
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07732.view.lkml"
include: "/views/domain_34/view_07734.view.lkml"
include: "/views/domain_35/view_07735.view.lkml"
include: "/views/domain_36/view_07736.view.lkml"

explore: explore_2577 {
  label: "Explore Explore 2577"
  description: "Comprehensive analytics explore joining base view_07732 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07732
  
  always_filter: {
    filters: [view_07732.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07732.created_at_date: "7 days"]
    unless: [view_07732.id, view_07732.status]
  }

  join: view_07734 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07732.user_id} = ${view_07734.id} ;;
    required_joins: []
  }

  join: view_07735 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07732.account_id} = ${view_07735.account_id} ;;
    required_joins: [view_07734]
  }

  join: view_07736 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07732.category} = ${view_07736.category} ;;
  }

  access_filter: {
    field: view_07732.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07732.is_deleted} = false ;;
}

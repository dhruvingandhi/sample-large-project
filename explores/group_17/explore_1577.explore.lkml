# Explore: explore_1577
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04732.view.lkml"
include: "/views/domain_34/view_04734.view.lkml"
include: "/views/domain_35/view_04735.view.lkml"
include: "/views/domain_36/view_04736.view.lkml"

explore: explore_1577 {
  label: "Explore Explore 1577"
  description: "Comprehensive analytics explore joining base view_04732 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04732
  
  always_filter: {
    filters: [view_04732.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04732.created_at_date: "7 days"]
    unless: [view_04732.id, view_04732.status]
  }

  join: view_04734 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04732.user_id} = ${view_04734.id} ;;
    required_joins: []
  }

  join: view_04735 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04732.account_id} = ${view_04735.account_id} ;;
    required_joins: [view_04734]
  }

  join: view_04736 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04732.category} = ${view_04736.category} ;;
  }

  access_filter: {
    field: view_04732.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04732.is_deleted} = false ;;
}

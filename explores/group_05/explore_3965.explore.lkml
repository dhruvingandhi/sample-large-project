# Explore: explore_3965
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11896.view.lkml"
include: "/views/domain_48/view_11898.view.lkml"
include: "/views/domain_49/view_11899.view.lkml"
include: "/views/domain_50/view_11900.view.lkml"

explore: explore_3965 {
  label: "Explore Explore 3965"
  description: "Comprehensive analytics explore joining base view_11896 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11896
  
  always_filter: {
    filters: [view_11896.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11896.created_at_date: "7 days"]
    unless: [view_11896.id, view_11896.status]
  }

  join: view_11898 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11896.user_id} = ${view_11898.id} ;;
    required_joins: []
  }

  join: view_11899 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11896.account_id} = ${view_11899.account_id} ;;
    required_joins: [view_11898]
  }

  join: view_11900 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11896.category} = ${view_11900.category} ;;
  }

  access_filter: {
    field: view_11896.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11896.is_deleted} = false ;;
}

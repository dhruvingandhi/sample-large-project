# Explore: explore_1965
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05896.view.lkml"
include: "/views/domain_48/view_05898.view.lkml"
include: "/views/domain_49/view_05899.view.lkml"
include: "/views/domain_50/view_05900.view.lkml"

explore: explore_1965 {
  label: "Explore Explore 1965"
  description: "Comprehensive analytics explore joining base view_05896 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05896
  
  always_filter: {
    filters: [view_05896.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05896.created_at_date: "7 days"]
    unless: [view_05896.id, view_05896.status]
  }

  join: view_05898 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05896.user_id} = ${view_05898.id} ;;
    required_joins: []
  }

  join: view_05899 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05896.account_id} = ${view_05899.account_id} ;;
    required_joins: [view_05898]
  }

  join: view_05900 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05896.category} = ${view_05900.category} ;;
  }

  access_filter: {
    field: view_05896.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05896.is_deleted} = false ;;
}

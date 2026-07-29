# Explore: explore_1961
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05884.view.lkml"
include: "/views/domain_36/view_05886.view.lkml"
include: "/views/domain_37/view_05887.view.lkml"
include: "/views/domain_38/view_05888.view.lkml"

explore: explore_1961 {
  label: "Explore Explore 1961"
  description: "Comprehensive analytics explore joining base view_05884 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05884
  
  always_filter: {
    filters: [view_05884.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05884.created_at_date: "7 days"]
    unless: [view_05884.id, view_05884.status]
  }

  join: view_05886 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05884.user_id} = ${view_05886.id} ;;
    required_joins: []
  }

  join: view_05887 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05884.account_id} = ${view_05887.account_id} ;;
    required_joins: [view_05886]
  }

  join: view_05888 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05884.category} = ${view_05888.category} ;;
  }

  access_filter: {
    field: view_05884.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05884.is_deleted} = false ;;
}

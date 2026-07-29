# Explore: explore_0961
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02884.view.lkml"
include: "/views/domain_36/view_02886.view.lkml"
include: "/views/domain_37/view_02887.view.lkml"
include: "/views/domain_38/view_02888.view.lkml"

explore: explore_0961 {
  label: "Explore Explore 0961"
  description: "Comprehensive analytics explore joining base view_02884 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02884
  
  always_filter: {
    filters: [view_02884.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02884.created_at_date: "7 days"]
    unless: [view_02884.id, view_02884.status]
  }

  join: view_02886 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02884.user_id} = ${view_02886.id} ;;
    required_joins: []
  }

  join: view_02887 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02884.account_id} = ${view_02887.account_id} ;;
    required_joins: [view_02886]
  }

  join: view_02888 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02884.category} = ${view_02888.category} ;;
  }

  access_filter: {
    field: view_02884.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02884.is_deleted} = false ;;
}

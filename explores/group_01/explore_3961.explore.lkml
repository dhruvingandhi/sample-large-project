# Explore: explore_3961
# Auto-generated LookML Explore File

include: "/views/domain_34/view_11884.view.lkml"
include: "/views/domain_36/view_11886.view.lkml"
include: "/views/domain_37/view_11887.view.lkml"
include: "/views/domain_38/view_11888.view.lkml"

explore: explore_3961 {
  label: "Explore Explore 3961"
  description: "Comprehensive analytics explore joining base view_11884 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11884
  
  always_filter: {
    filters: [view_11884.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11884.created_at_date: "7 days"]
    unless: [view_11884.id, view_11884.status]
  }

  join: view_11886 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11884.user_id} = ${view_11886.id} ;;
    required_joins: []
  }

  join: view_11887 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11884.account_id} = ${view_11887.account_id} ;;
    required_joins: [view_11886]
  }

  join: view_11888 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11884.category} = ${view_11888.category} ;;
  }

  access_filter: {
    field: view_11884.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11884.is_deleted} = false ;;
}

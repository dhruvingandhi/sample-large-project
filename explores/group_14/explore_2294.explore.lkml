# Explore: explore_2294
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06883.view.lkml"
include: "/views/domain_35/view_06885.view.lkml"
include: "/views/domain_36/view_06886.view.lkml"
include: "/views/domain_37/view_06887.view.lkml"

explore: explore_2294 {
  label: "Explore Explore 2294"
  description: "Comprehensive analytics explore joining base view_06883 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06883
  
  always_filter: {
    filters: [view_06883.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06883.created_at_date: "7 days"]
    unless: [view_06883.id, view_06883.status]
  }

  join: view_06885 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06883.user_id} = ${view_06885.id} ;;
    required_joins: []
  }

  join: view_06886 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06883.account_id} = ${view_06886.account_id} ;;
    required_joins: [view_06885]
  }

  join: view_06887 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06883.category} = ${view_06887.category} ;;
  }

  access_filter: {
    field: view_06883.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06883.is_deleted} = false ;;
}

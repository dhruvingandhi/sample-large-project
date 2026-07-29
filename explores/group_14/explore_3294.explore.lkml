# Explore: explore_3294
# Auto-generated LookML Explore File

include: "/views/domain_33/view_09883.view.lkml"
include: "/views/domain_35/view_09885.view.lkml"
include: "/views/domain_36/view_09886.view.lkml"
include: "/views/domain_37/view_09887.view.lkml"

explore: explore_3294 {
  label: "Explore Explore 3294"
  description: "Comprehensive analytics explore joining base view_09883 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09883
  
  always_filter: {
    filters: [view_09883.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09883.created_at_date: "7 days"]
    unless: [view_09883.id, view_09883.status]
  }

  join: view_09885 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09883.user_id} = ${view_09885.id} ;;
    required_joins: []
  }

  join: view_09886 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09883.account_id} = ${view_09886.account_id} ;;
    required_joins: [view_09885]
  }

  join: view_09887 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09883.category} = ${view_09887.category} ;;
  }

  access_filter: {
    field: view_09883.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09883.is_deleted} = false ;;
}

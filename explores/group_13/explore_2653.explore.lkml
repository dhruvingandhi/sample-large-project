# Explore: explore_2653
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07960.view.lkml"
include: "/views/domain_12/view_07962.view.lkml"
include: "/views/domain_13/view_07963.view.lkml"
include: "/views/domain_14/view_07964.view.lkml"

explore: explore_2653 {
  label: "Explore Explore 2653"
  description: "Comprehensive analytics explore joining base view_07960 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07960
  
  always_filter: {
    filters: [view_07960.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07960.created_at_date: "7 days"]
    unless: [view_07960.id, view_07960.status]
  }

  join: view_07962 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07960.user_id} = ${view_07962.id} ;;
    required_joins: []
  }

  join: view_07963 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07960.account_id} = ${view_07963.account_id} ;;
    required_joins: [view_07962]
  }

  join: view_07964 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07960.category} = ${view_07964.category} ;;
  }

  access_filter: {
    field: view_07960.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07960.is_deleted} = false ;;
}

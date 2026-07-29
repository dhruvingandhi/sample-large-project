# Explore: explore_2560
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07681.view.lkml"
include: "/views/domain_33/view_07683.view.lkml"
include: "/views/domain_34/view_07684.view.lkml"
include: "/views/domain_35/view_07685.view.lkml"

explore: explore_2560 {
  label: "Explore Explore 2560"
  description: "Comprehensive analytics explore joining base view_07681 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07681
  
  always_filter: {
    filters: [view_07681.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07681.created_at_date: "7 days"]
    unless: [view_07681.id, view_07681.status]
  }

  join: view_07683 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07681.user_id} = ${view_07683.id} ;;
    required_joins: []
  }

  join: view_07684 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07681.account_id} = ${view_07684.account_id} ;;
    required_joins: [view_07683]
  }

  join: view_07685 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07681.category} = ${view_07685.category} ;;
  }

  access_filter: {
    field: view_07681.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07681.is_deleted} = false ;;
}

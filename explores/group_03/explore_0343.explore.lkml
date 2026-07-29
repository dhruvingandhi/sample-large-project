# Explore: explore_0343
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01030.view.lkml"
include: "/views/domain_32/view_01032.view.lkml"
include: "/views/domain_33/view_01033.view.lkml"
include: "/views/domain_34/view_01034.view.lkml"

explore: explore_0343 {
  label: "Explore Explore 0343"
  description: "Comprehensive analytics explore joining base view_01030 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01030
  
  always_filter: {
    filters: [view_01030.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01030.created_at_date: "7 days"]
    unless: [view_01030.id, view_01030.status]
  }

  join: view_01032 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01030.user_id} = ${view_01032.id} ;;
    required_joins: []
  }

  join: view_01033 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01030.account_id} = ${view_01033.account_id} ;;
    required_joins: [view_01032]
  }

  join: view_01034 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01030.category} = ${view_01034.category} ;;
  }

  access_filter: {
    field: view_01030.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01030.is_deleted} = false ;;
}

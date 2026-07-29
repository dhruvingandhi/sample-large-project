# Explore: explore_2622
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07867.view.lkml"
include: "/views/domain_19/view_07869.view.lkml"
include: "/views/domain_20/view_07870.view.lkml"
include: "/views/domain_21/view_07871.view.lkml"

explore: explore_2622 {
  label: "Explore Explore 2622"
  description: "Comprehensive analytics explore joining base view_07867 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07867
  
  always_filter: {
    filters: [view_07867.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07867.created_at_date: "7 days"]
    unless: [view_07867.id, view_07867.status]
  }

  join: view_07869 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07867.user_id} = ${view_07869.id} ;;
    required_joins: []
  }

  join: view_07870 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07867.account_id} = ${view_07870.account_id} ;;
    required_joins: [view_07869]
  }

  join: view_07871 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07867.category} = ${view_07871.category} ;;
  }

  access_filter: {
    field: view_07867.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07867.is_deleted} = false ;;
}

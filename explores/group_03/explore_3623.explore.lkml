# Explore: explore_3623
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10870.view.lkml"
include: "/views/domain_22/view_10872.view.lkml"
include: "/views/domain_23/view_10873.view.lkml"
include: "/views/domain_24/view_10874.view.lkml"

explore: explore_3623 {
  label: "Explore Explore 3623"
  description: "Comprehensive analytics explore joining base view_10870 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10870
  
  always_filter: {
    filters: [view_10870.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10870.created_at_date: "7 days"]
    unless: [view_10870.id, view_10870.status]
  }

  join: view_10872 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10870.user_id} = ${view_10872.id} ;;
    required_joins: []
  }

  join: view_10873 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10870.account_id} = ${view_10873.account_id} ;;
    required_joins: [view_10872]
  }

  join: view_10874 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10870.category} = ${view_10874.category} ;;
  }

  access_filter: {
    field: view_10870.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10870.is_deleted} = false ;;
}

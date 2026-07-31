# Update for 2000 file diff target
# Explore: explore_3658
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10975.view.lkml"
include: "/views/domain_27/view_10977.view.lkml"
include: "/views/domain_28/view_10978.view.lkml"
include: "/views/domain_29/view_10979.view.lkml"

explore: explore_3658 {
  label: "Explore Explore 3658"
  description: "Comprehensive analytics explore joining base view_10975 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10975
  
  always_filter: {
    filters: [view_10975.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10975.created_at_date: "7 days"]
    unless: [view_10975.id, view_10975.status]
  }

  join: view_10977 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10975.user_id} = ${view_10977.id} ;;
    required_joins: []
  }

  join: view_10978 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10975.account_id} = ${view_10978.account_id} ;;
    required_joins: [view_10977]
  }

  join: view_10979 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10975.category} = ${view_10979.category} ;;
  }

  access_filter: {
    field: view_10975.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10975.is_deleted} = false ;;
}

# Explore: explore_1639
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04918.view.lkml"
include: "/views/domain_20/view_04920.view.lkml"
include: "/views/domain_21/view_04921.view.lkml"
include: "/views/domain_22/view_04922.view.lkml"

explore: explore_1639 {
  label: "Explore Explore 1639"
  description: "Comprehensive analytics explore joining base view_04918 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04918
  
  always_filter: {
    filters: [view_04918.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04918.created_at_date: "7 days"]
    unless: [view_04918.id, view_04918.status]
  }

  join: view_04920 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04918.user_id} = ${view_04920.id} ;;
    required_joins: []
  }

  join: view_04921 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04918.account_id} = ${view_04921.account_id} ;;
    required_joins: [view_04920]
  }

  join: view_04922 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04918.category} = ${view_04922.category} ;;
  }

  access_filter: {
    field: view_04918.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04918.is_deleted} = false ;;
}

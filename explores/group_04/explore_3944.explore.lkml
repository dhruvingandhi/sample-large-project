# Explore: explore_3944
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11833.view.lkml"
include: "/views/domain_35/view_11835.view.lkml"
include: "/views/domain_36/view_11836.view.lkml"
include: "/views/domain_37/view_11837.view.lkml"

explore: explore_3944 {
  label: "Explore Explore 3944"
  description: "Comprehensive analytics explore joining base view_11833 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11833
  
  always_filter: {
    filters: [view_11833.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11833.created_at_date: "7 days"]
    unless: [view_11833.id, view_11833.status]
  }

  join: view_11835 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11833.user_id} = ${view_11835.id} ;;
    required_joins: []
  }

  join: view_11836 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11833.account_id} = ${view_11836.account_id} ;;
    required_joins: [view_11835]
  }

  join: view_11837 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11833.category} = ${view_11837.category} ;;
  }

  access_filter: {
    field: view_11833.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11833.is_deleted} = false ;;
}

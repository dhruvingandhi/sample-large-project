# Explore: explore_1244
# Auto-generated LookML Explore File

include: "/views/domain_33/view_03733.view.lkml"
include: "/views/domain_35/view_03735.view.lkml"
include: "/views/domain_36/view_03736.view.lkml"
include: "/views/domain_37/view_03737.view.lkml"

explore: explore_1244 {
  label: "Explore Explore 1244"
  description: "Comprehensive analytics explore joining base view_03733 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03733
  
  always_filter: {
    filters: [view_03733.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03733.created_at_date: "7 days"]
    unless: [view_03733.id, view_03733.status]
  }

  join: view_03735 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03733.user_id} = ${view_03735.id} ;;
    required_joins: []
  }

  join: view_03736 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03733.account_id} = ${view_03736.account_id} ;;
    required_joins: [view_03735]
  }

  join: view_03737 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03733.category} = ${view_03737.category} ;;
  }

  access_filter: {
    field: view_03733.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03733.is_deleted} = false ;;
}

# Explore: explore_3686
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11059.view.lkml"
include: "/views/domain_11/view_11061.view.lkml"
include: "/views/domain_12/view_11062.view.lkml"
include: "/views/domain_13/view_11063.view.lkml"

explore: explore_3686 {
  label: "Explore Explore 3686"
  description: "Comprehensive analytics explore joining base view_11059 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11059
  
  always_filter: {
    filters: [view_11059.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11059.created_at_date: "7 days"]
    unless: [view_11059.id, view_11059.status]
  }

  join: view_11061 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11059.user_id} = ${view_11061.id} ;;
    required_joins: []
  }

  join: view_11062 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11059.account_id} = ${view_11062.account_id} ;;
    required_joins: [view_11061]
  }

  join: view_11063 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11059.category} = ${view_11063.category} ;;
  }

  access_filter: {
    field: view_11059.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11059.is_deleted} = false ;;
}

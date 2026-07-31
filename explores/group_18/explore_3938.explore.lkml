# Update for 2000 file diff target
# Explore: explore_3938
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11815.view.lkml"
include: "/views/domain_17/view_11817.view.lkml"
include: "/views/domain_18/view_11818.view.lkml"
include: "/views/domain_19/view_11819.view.lkml"

explore: explore_3938 {
  label: "Explore Explore 3938"
  description: "Comprehensive analytics explore joining base view_11815 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11815
  
  always_filter: {
    filters: [view_11815.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11815.created_at_date: "7 days"]
    unless: [view_11815.id, view_11815.status]
  }

  join: view_11817 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11815.user_id} = ${view_11817.id} ;;
    required_joins: []
  }

  join: view_11818 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11815.account_id} = ${view_11818.account_id} ;;
    required_joins: [view_11817]
  }

  join: view_11819 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11815.category} = ${view_11819.category} ;;
  }

  access_filter: {
    field: view_11815.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11815.is_deleted} = false ;;
}

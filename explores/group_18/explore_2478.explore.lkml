# Update for 2000 file diff target
# Explore: explore_2478
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07435.view.lkml"
include: "/views/domain_37/view_07437.view.lkml"
include: "/views/domain_38/view_07438.view.lkml"
include: "/views/domain_39/view_07439.view.lkml"

explore: explore_2478 {
  label: "Explore Explore 2478"
  description: "Comprehensive analytics explore joining base view_07435 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07435
  
  always_filter: {
    filters: [view_07435.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07435.created_at_date: "7 days"]
    unless: [view_07435.id, view_07435.status]
  }

  join: view_07437 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07435.user_id} = ${view_07437.id} ;;
    required_joins: []
  }

  join: view_07438 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07435.account_id} = ${view_07438.account_id} ;;
    required_joins: [view_07437]
  }

  join: view_07439 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07435.category} = ${view_07439.category} ;;
  }

  access_filter: {
    field: view_07435.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07435.is_deleted} = false ;;
}

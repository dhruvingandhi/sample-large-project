# Explore: explore_3503
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10510.view.lkml"
include: "/views/domain_12/view_10512.view.lkml"
include: "/views/domain_13/view_10513.view.lkml"
include: "/views/domain_14/view_10514.view.lkml"

explore: explore_3503 {
  label: "Explore Explore 3503"
  description: "Comprehensive analytics explore joining base view_10510 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10510
  
  always_filter: {
    filters: [view_10510.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10510.created_at_date: "7 days"]
    unless: [view_10510.id, view_10510.status]
  }

  join: view_10512 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10510.user_id} = ${view_10512.id} ;;
    required_joins: []
  }

  join: view_10513 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10510.account_id} = ${view_10513.account_id} ;;
    required_joins: [view_10512]
  }

  join: view_10514 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10510.category} = ${view_10514.category} ;;
  }

  access_filter: {
    field: view_10510.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10510.is_deleted} = false ;;
}

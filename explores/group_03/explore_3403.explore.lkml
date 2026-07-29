# Explore: explore_3403
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10210.view.lkml"
include: "/views/domain_12/view_10212.view.lkml"
include: "/views/domain_13/view_10213.view.lkml"
include: "/views/domain_14/view_10214.view.lkml"

explore: explore_3403 {
  label: "Explore Explore 3403"
  description: "Comprehensive analytics explore joining base view_10210 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10210
  
  always_filter: {
    filters: [view_10210.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10210.created_at_date: "7 days"]
    unless: [view_10210.id, view_10210.status]
  }

  join: view_10212 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10210.user_id} = ${view_10212.id} ;;
    required_joins: []
  }

  join: view_10213 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10210.account_id} = ${view_10213.account_id} ;;
    required_joins: [view_10212]
  }

  join: view_10214 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10210.category} = ${view_10214.category} ;;
  }

  access_filter: {
    field: view_10210.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10210.is_deleted} = false ;;
}

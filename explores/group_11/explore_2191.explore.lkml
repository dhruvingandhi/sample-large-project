# Explore: explore_2191
# Auto-generated LookML Explore File

include: "/views/domain_24/view_06574.view.lkml"
include: "/views/domain_26/view_06576.view.lkml"
include: "/views/domain_27/view_06577.view.lkml"
include: "/views/domain_28/view_06578.view.lkml"

explore: explore_2191 {
  label: "Explore Explore 2191"
  description: "Comprehensive analytics explore joining base view_06574 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06574
  
  always_filter: {
    filters: [view_06574.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06574.created_at_date: "7 days"]
    unless: [view_06574.id, view_06574.status]
  }

  join: view_06576 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06574.user_id} = ${view_06576.id} ;;
    required_joins: []
  }

  join: view_06577 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06574.account_id} = ${view_06577.account_id} ;;
    required_joins: [view_06576]
  }

  join: view_06578 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06574.category} = ${view_06578.category} ;;
  }

  access_filter: {
    field: view_06574.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06574.is_deleted} = false ;;
}

# Update for 2000 file diff target
# Explore: explore_1578
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04735.view.lkml"
include: "/views/domain_37/view_04737.view.lkml"
include: "/views/domain_38/view_04738.view.lkml"
include: "/views/domain_39/view_04739.view.lkml"

explore: explore_1578 {
  label: "Explore Explore 1578"
  description: "Comprehensive analytics explore joining base view_04735 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04735
  
  always_filter: {
    filters: [view_04735.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04735.created_at_date: "7 days"]
    unless: [view_04735.id, view_04735.status]
  }

  join: view_04737 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04735.user_id} = ${view_04737.id} ;;
    required_joins: []
  }

  join: view_04738 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04735.account_id} = ${view_04738.account_id} ;;
    required_joins: [view_04737]
  }

  join: view_04739 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04735.category} = ${view_04739.category} ;;
  }

  access_filter: {
    field: view_04735.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04735.is_deleted} = false ;;
}
